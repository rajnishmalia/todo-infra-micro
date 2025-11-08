locals {
    common_tags = {
        "managed_by" = "terraform"
        "owner" = "TodoAppTeam"
        "Environment" = "dev"
    }
}

module "rg" {
    source = "../../module/resource_group"
    rg_name = "rg-dev-todoapp"
    rg_location = "centralindia"
    tags = local.common_tags
}
module "acr" {
    source = "../../module/azure_container_registry"
    depends_on = [module.rg]
    acr_name = "acrdevtodoapp20250910"
    location = "centralindia"
    rg_name = "rg-dev-todoapp"
    tags = local.common_tags
}
module "sql_server" {
    source = "../../module/sql_server"
    depends_on = [module.rg]
    sql_server_name = "sql-dev-todoapp0910"
    location = "centralindia"
    rg_name = "rg-dev-todoapp"
    admin_username = "sqladminuser"
    admin_password = "P@ssword1234"
    tags = local.common_tags
}
module "sql_db" {
    source = "../../module/sql_db"
    depends_on = [module.sql_server]
    sql_db_name = "sqldb-dev-todoapp"
    server_id = module.sql_server.id
    max_size_db = "2"
    tags = local.common_tags
}
module "aks" {
    source = "../../module/azure_kubernetes_cluster"
    depends_on = [module.rg]
    aks_name = "aks-dev-todoapp"
    location = "centralindia"
    rg_name = "rg-dev-todoapp"
    dns_prefix = "aks-dev-todoapp"
    tags = local.common_tags
}