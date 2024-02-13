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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace library.frames
{
    /// <summary>
    /// Логика взаимодействия для ActiveRequest.xaml
    /// </summary>
    public partial class ActiveRequest : Page
    {
        private List<Request> allrequest;
        public ActiveRequest()
        {
            InitializeComponent();
            allrequest = DbConnect.prObj.Request.ToList();
        }

        private void Books_Button(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new Menu());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new ActiveRequest());
        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (RequestSort.SelectedIndex == 0)
            {
                List<Request> sortMaterials = allrequest.OrderBy(x => x.UserName).ToList();
                RequestList.ItemsSource = sortMaterials;
            }
            else if (RequestList.SelectedIndex == 1)
            {
                List<Request> sortMaterials = allrequest.OrderByDescending(x => x.BookName).ToList();
                RequestList.ItemsSource = sortMaterials;
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                var item = RequestList.SelectedItem as Request;
                DbConnect.prObj.Request.Remove(item);
                DbConnect.prObj.SaveChanges();

                MessageBox.Show("Заказ завершен!",
                        "Уведомление",
                        MessageBoxButton.OK,
                        MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(),
                    "Критический сбой работы приложения",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
            }
        }
    }
}
