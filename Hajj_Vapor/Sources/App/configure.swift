import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: "localhost",
        username: "nouraalthemali",
        password: "vapor_password",
        database: "hajj_vapor"),
    as: .psql)

    app.migrations.add(CreatePilgrim())
    app.migrations.add(CreateItinerary())

    // register routes
    try routes(app)
}
