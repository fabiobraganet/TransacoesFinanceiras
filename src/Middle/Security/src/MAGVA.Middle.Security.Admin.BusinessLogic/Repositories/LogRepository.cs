﻿using MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Common;
using MAGVA.Middle.Security.Admin.BusinessLogic.Helpers;
using MAGVA.Middle.Security.Admin.EntityFramework.DbContexts;
using MAGVA.Middle.Security.Admin.EntityFramework.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Repositories
{
    public class LogRepository : ILogRepository
    {
        private readonly AdminDbContext _dbContext;

        public LogRepository(AdminDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<PagedList<Log>> GetLogsAsync(string search, int page = 1, int pageSize = 10)
        {
            var pagedList = new PagedList<Log>();
            Expression<Func<Log, bool>> searchCondition = x => x.LogEvent.Contains(search) || x.Message.Contains(search) || x.Exception.Contains(search);
            var logs = await _dbContext.Logs
                .WhereIf(!string.IsNullOrEmpty(search), searchCondition)
                .PageBy(x => x.Id, page, pageSize)
                .ToListAsync();

            pagedList.Data.AddRange(logs);
            pagedList.PageSize = pageSize;
            pagedList.TotalCount = await _dbContext.Logs.WhereIf(!string.IsNullOrEmpty(search), searchCondition).CountAsync();

            return pagedList;
        }
    }
}