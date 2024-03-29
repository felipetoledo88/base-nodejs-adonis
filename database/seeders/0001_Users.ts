import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Users from 'App/Models/Users'

export default class UsersSeeder extends BaseSeeder {

    public async run() {
        await Users.createMany([
            {
                id_profile: 1,
                name: 'Admin',
                email: 'admin@admin.com',
                password: '123',
            },
            {
                id_profile: 2,
                name: 'Cliente',
                email: 'cliente@cliente.com',
                password: '123',
            },
        ])
    }

}
