using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Core;

namespace Action.Engine.Command
{
    public interface ICommand
    {
        /// <summary>
        /// 命令代码
        /// </summary>
        int Code { get; }

        /// <summary>
        /// 命令名称
        /// </summary>
        string Name { get; }

        /// <summary>
        /// 验证当前命令是否被授权
        /// </summary>
        /// <returns></returns>
        bool Validate();

        /// <summary>
        /// 初始化命令
        /// </summary>
        /// <param name="knl"></param>
        void Initialize(IKernel knl);

        /// <summary>
        /// 执行命令
        /// </summary>
        /// <param name="args"></param>
        void Execute(object input);
    }
}
