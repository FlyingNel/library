﻿using System;
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
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Page
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var userObj = DbConnect.prObj.Users.FirstOrDefault(x => x.Login == TxbLogin.Text && x.Password == TxbPassword.Text);
                if (userObj == null)
                {
                    MessageBox.Show("Такой пользователь не найден!",
                               "Уведомление",
                               MessageBoxButton.OK,
                               MessageBoxImage.Information);
                }
                else
                {
                    switch (userObj.IdRole.Id)
                    {
                        case 1:
                            MessageBox.Show("Здравствуйте, Администратор " + userObj.Name + "!",
                               "Уведомление",
                               MessageBoxButton.OK,
                               MessageBoxImage.Information);
                            FrameApp.frmObj.Navigate(new Menu());
                            break;
                        case 2:
                            MessageBox.Show("Здравствуйте, учитель " + userObj.Name + "!",
                               "Уведомление",
                               MessageBoxButton.OK,
                               MessageBoxImage.Information);
                            FrameApp.frmObj.Navigate(new Book());
                            break;
                        case 3:
                            MessageBox.Show("Здравствуйте, ученик " + userObj.Name + "!",
                               "Уведомление",
                               MessageBoxButton.OK,
                               MessageBoxImage.Information);
                            FrameApp.frmObj.Navigate(new Book());
                            break;
                        case 4:
                            MessageBox.Show("Здравствуйте, библиотекарь " + userObj.Name + "!",
                               "Уведомление",
                               MessageBoxButton.OK,
                               MessageBoxImage.Information);
                            FrameApp.frmObj.Navigate(new Menu());
                            break;
                        default:
                            MessageBox.Show("Такой пользователь не найден!",
                               "Уведомление",
                               MessageBoxButton.OK,
                               MessageBoxImage.Information);
                            break;

                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Критический сбой в работе предложения: " + ex.Message.ToString(),
                                "Уведомление",
                                MessageBoxButton.OK,
                                MessageBoxImage.Warning);
            }
        }
    }
}
