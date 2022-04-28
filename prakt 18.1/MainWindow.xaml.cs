using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace prakt_18._1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        SalaryEntities1 db = SalaryEntities1.GetContext();
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.MonthlySalaries.Load();
            DataGrid.ItemsSource = db.MonthlySalaries.Local.ToBindingList();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            AddRecord addRecord = new AddRecord();
            addRecord.ShowDialog();
            DataGrid.Focus();
        }

        private void Change_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = DataGrid.SelectedIndex;
            if (indexRow != -1)
            {
                MonthlySalary row = (MonthlySalary)DataGrid.Items[indexRow];
                Transfer.Id = row.Id;
                EditRecord editRecord = new EditRecord();
                editRecord.ShowDialog();
                DataGrid.Items.Refresh();
                DataGrid.Focus();
            }
            else
            {
                MessageBox.Show("Сначало выберете строку", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    MonthlySalary row = (MonthlySalary)DataGrid.SelectedItems[0];
                    db.MonthlySalaries.Remove(row);
                    db.SaveChanges();
                }
                catch(ArgumentOutOfRangeException)
                {
                    MessageBox.Show("Выберите запись", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void Search_Click(object sender, RoutedEventArgs e)
        {
            bool done = false;
            for (int i = 0; i < DataGrid.Items.Count; i++)
            {
                var row = (MonthlySalary)DataGrid.Items[i];
                string findContent = row.FirstName.ToLower();
                if (findText.Text == string.Empty)
                {
                    MessageBox.Show("Введите фамилию", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (findContent == findText.Text.ToLower())
                {
                    object item = DataGrid.Items[i];
                    DataGrid.SelectedItem = item;
                    DataGrid.ScrollIntoView(item);
                    DataGrid.Focus();
                    done = true;
                    break;
                }
            }
            if (done == false)
            {
                MessageBox.Show("Фамилия не найдена", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
        }
        List<MonthlySalary> _monthlySalaries;
        private void Filtered_Click(object sender, RoutedEventArgs e)
        {
            _monthlySalaries = db.MonthlySalaries.ToList();
            if (byte.TryParse(filterText.Text, out byte filter))
            {
                var filtered = _monthlySalaries.Where(_monthlySalaries => _monthlySalaries.Category == filter);
                DataGrid.ItemsSource = filtered;
            }
            else
            {
                MessageBox.Show("Введены неверные данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void FilterReset_Click(object sender, RoutedEventArgs e)
        {
            DataGrid.ItemsSource = db.MonthlySalaries.Local.ToBindingList();
        }

        private void Info_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Савельев Дмитрий Александрович В13\nПрактическая работа №18\nРазработать интерфейс для доступа и управления однотабличной базой данных «Сведения о месячной зарплате рабочих». База данных должна содержать следующую информацию: фамилию, имя, отчество рабочего, название цеха, в котором он работает, дату поступления на работу. По заработной плате необходимо хранить информацию о ее размере, стаже работника, его разряде и должности.", "Информация о программе", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
