use sqlx::{PgPool, postgres::PgPoolOptions};
use dotenv::dotenv;
use std::env;

pub async fn connect_db() -> Result<PgPool, sqlx::Error> {
    dotenv().ok();

    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL no está en .env");

    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&database_url)
        .await?;

    println!("✅ Conectado a la base de datos");

    Ok(pool)
}