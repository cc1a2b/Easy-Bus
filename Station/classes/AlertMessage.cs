using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI;
using System;

namespace Station.classes
{
    public class AlertMessage
    {
        public static string SuccessSave = "<strong>نجاح..! </strong>" + "تم حفظ السجل بنجاح...؛";

        public static string SuccessUpdate = "<strong>نجاح..! </strong>" + "تم تعديل السجل بنجاح...؛";

        public static string SuccessDelete = "<strong>نجاح..! </strong>" + "تم حذف السجل بنجاح...؛";

        public static string FailedView = "<strong>تنبيه..! </strong>" + "عفواً..! تعذر عرض البيانات...؛";

        public static string FailedSave = "<strong>تنبيه..! </strong>" + "عفواً..! تعذر حفظ السجل...؛";

        public static string FailedUpdate = "<strong>تنبيه..! </strong>" + "عفواً..! تعذر تعديل السجل...؛";

        public static string FailedDelete = "<strong>تنبيه..! </strong>" + "عفواً..! تعذر حذف السجل...؛" + "\n" + "ربما يكون مرتبط بسجلات أخرى...";

        public static string FailedAccess = "<strong>تنبيه..! </strong>" + "عفواً..! غير مسموح بعرض البيانات...؛" + "\n" + "برحاء الرجوع لمسئول النظام";

        public static string MissingField = "<strong>تنبيه..! </strong>" + "من فضلك أكمل البيانات المطلوبة...؛";

        public static string MissingDate = "<strong>تنبيه..! </strong>" + "من فضلك حدد تاريخ الفترة لعرض البيانات...؛";

        public static string ConfirmDeleteMsg = "<strong>تنبيه..! </strong>" + "هل تريد تأكيد تنفيذ الإجراء..?";

        public static string WrongFile = "<strong>تنبيه..! </strong>" + "عفواً..! صيغة الملف غير مدعومة...؛";

    }

}
