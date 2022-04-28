using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace prakt_18._1
{
    /// <summary>
    /// Логика взаимодействия для EditRecord.xaml
    /// </summary>
    public partial class EditRecord : Window
    {
        public EditRecord()
        {
            InitializeComponent();
        }
        SalaryEntities1 db = SalaryEntities1.GetContext();
        MonthlySalary monthlySalary;
        private void Change_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (firstName.Text == string.Empty || middleName.Text == string.Empty || lastName.Text == string.Empty)
            {
                errors.AppendLine("Заполните ФИО");
            }
            if (workshop.Text == string.Empty)
            {
                errors.AppendLine("Заполните название цеха");
            }
            if (!decimal.TryParse(sizeSalary.Text, out decimal salary) || salary <= 0)
            {
                errors.AppendLine("Введены неверные данные заработной платы");
            }
            if (!byte.TryParse(workExperiance.Text, out byte experiance) || experiance < 0)
            {
                errors.AppendLine("Введены неверные данные стажа");
            }
            if (!byte.TryParse(categoryText.Text, out byte category))
            {
                errors.AppendLine("Введите разряд");
            }
            if (position.Text == string.Empty)
            {
                errors.AppendLine("Заполните должность");
            }
            if (dateText.Text.Length == 0 || dateText.SelectedDate > DateTime.Now)
            {
                errors.AppendLine("Выберите корректную дату");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            monthlySalary.FirstName = firstName.Text;
            monthlySalary.LastName = lastName.Text;
            monthlySalary.MiddleName = middleName.Text;
            monthlySalary.Workshop = workshop.Text;
            monthlySalary.SizeSalary = salary;
            monthlySalary.WorkExperiance = experiance;
            monthlySalary.Category = category;
            monthlySalary.Date = (DateTime)dateText.SelectedDate;
            monthlySalary.Position = position.Text;
            try
            {
                db.SaveChanges();
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            monthlySalary = db.MonthlySalaries.Find(Transfer.Id);
            firstName.Text = monthlySalary.FirstName;
            lastName.Text = monthlySalary.LastName;
            middleName.Text = monthlySalary.MiddleName;
            workshop.Text = monthlySalary.Workshop;
            sizeSalary.Text = Convert.ToString(monthlySalary.SizeSalary);
            workExperiance.Text = Convert.ToString(monthlySalary.WorkExperiance);
            categoryText.Text = Convert.ToString(monthlySalary.Category);
            dateText.Text = Convert.ToString(monthlySalary.Date);
            position.Text = monthlySalary.Position;

        }
    }
}
