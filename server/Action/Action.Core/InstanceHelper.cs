using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;

namespace Action.Core
{
    /// <summary>
    /// ʵ����������
    /// </summary>
    public class InstanceHelper
    {
        /// <summary>
        /// ����ʵ��
        /// </summary>
        /// <param name="assemplyName"></param>
        /// <param name="className"></param>
        /// <returns></returns>
        public static object CreateInstance(string assemblyName, string className)
        {
            try
            {
                Assembly assembly = Assembly.Load(assemblyName);
                return assembly.CreateInstance(className);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                return null;
            }
        }

        /// <summary>
        /// ����ʵ��
        /// </summary>
        /// <param name="classType"></param>
        /// <returns></returns>
        public static object CreateInstance(Type classType)
        {
            return CreateInstance(classType.Assembly.FullName, classType.FullName);
        }

        /// <summary>
        /// ����ʵ��
        /// </summary>
        /// <param name="class_assembly_Name"></param>
        /// <returns></returns>
        public static object CreateInstance(string class_assembly_Name)
        {
            int p = class_assembly_Name.IndexOf(",");
            if (p < 0)
                return null;

            string className = class_assembly_Name.Substring(0, p).Trim();
            string assemblyName = class_assembly_Name.Substring(p + 1).Trim();
            return CreateInstance(assemblyName, className);
        }
    }
}
