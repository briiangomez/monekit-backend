﻿ using Neptuo.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Money.Models.Queries
{
    /// <summary>
    /// A query for getting list of months with outcome.
    /// </summary>
    public class ListMonthWithOutcome : UserQuery, IQuery<List<MonthModel>>
    { }
}
