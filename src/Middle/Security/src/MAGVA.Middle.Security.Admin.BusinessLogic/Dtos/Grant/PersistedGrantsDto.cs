﻿using System.Collections.Generic;

namespace MAGVA.Middle.Security.Admin.BusinessLogic.Dtos.Grant
{
	public class PersistedGrantsDto
	{
		public PersistedGrantsDto()
		{
			PersistedGrants = new List<PersistedGrantDto>();
		}

	    public int SubjectId { get; set; }

		public int TotalCount { get; set; }

		public int PageSize { get; set; }

		public List<PersistedGrantDto> PersistedGrants { get; set; }
	}
}