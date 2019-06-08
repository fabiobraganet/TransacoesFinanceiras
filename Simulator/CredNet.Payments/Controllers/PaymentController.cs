
namespace CredNet.Payments.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Models;

    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {

        [HttpGet("{id}")]
        public ActionResult<Transaction> Get(int id)
        {
            return new Transaction("C", 1, 1, new Card(
                cardholdername: "Eike Batista", 
                number: "4012001037141112", 
                expirationdate: "11/22",
                cardbrand: "VISA", 
                password: "xxxxxxxxxxx", 
                type: "Chip", 
                haspassword: false));
        }
        
        [HttpPost]
        public void Post([FromBody] Transaction transaction)
        {
        }

    }
}
