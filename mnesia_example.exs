defmodule MnesiaExample do
    def start do
        :mnesia.create_schema([node()])
        :mnesia.start()
    end

    def stop, do: :mnesia.stop()

    def init_db do
        :mnesia.create_table(Customer, [attributes: [:id, :name, :age]])
        :mnesia.create_table(Contact, [attributes: [:id, :customer_id, :phone, :address]])
    end

    def fixtures_db do
        :mnesia.transaction(
            fn ->
                :mnesia.write({Customer, 1, "Cust 1", 10})
                :mnesia.write({Customer, 2, "Cust 2", 20})
                :mnesia.write({Contact, 1, 1, "+380978317320", "Kiev, Khreschatyk 1"})
                :mnesia.write({Contact, 2, 2, "+380978317311", "Kiev, Khreschatyk 12"})
                :mnesia.write({Contact, 3, 1, "+380978311220", "Kiev, Khreschatyk 13"})
            end
        )
        :mnesia.add_table_index(Customer, :name)
    end

    def check_db do
        {:atomic, customer} = :mnesia.transaction(fn -> :mnesia.read(Customer, 1) end)
        {:atomic, contact} = :mnesia.transaction(fn -> :mnesia.read(Contact, 1) end)
        IO.inspect customer
        IO.inspect contact
    end

    def drop_db do
        :mnesia.delete_table(Customer)
        :mnesia.delete_table(Contact)
    end

    def info do
        init_db()
        IO.inspect fixtures_db()
        IO.inspect check_db()
        drop_db()
    end
end

MnesiaExample.start()
MnesiaExample.info()
MnesiaExample.stop()