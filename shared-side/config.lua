-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DO NODE-DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
Config = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DE PORTAS
-----------------------------------------------------------------------------------------------------------------------------------------
Config.Door = {
	-- Distância padrão de interação
	DefaultDistance = 1.75,
	
	-- Taxa padrão de abertura/fechamento
	DefaultDoorRate = 5.0,
	
	-- Tempo padrão de autolock (em segundos, 0 = desabilitado)
	DefaultAutolock = 0
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DE PERMISSÕES
-- Formato: { Groups = { "Grupo1", "Grupo2" }, MinHierarchy = 1 }
-- Groups: Lista de grupos que podem acessar (use nomes exatos de vrp/config/Global.lua)
-- MinHierarchy: Hierarquia mínima necessária (1 = primeira hierarquia, nil = todas)
-----------------------------------------------------------------------------------------------------------------------------------------
Config.Permissions = {
	-- Acesso ao gerenciamento de portas
	DoorManagement = {
		Groups = { "Admin" },
		MinHierarchy = 1
	}
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO AUXILIAR PARA VERIFICAR PERMISSÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function Config.HasPermission(Passport, PermissionName)
	local Permission = Config.Permissions[PermissionName]
	if not Permission then
		return false
	end
	
	-- Verificar grupos
	local HasGroup = false
	for _, GroupName in ipairs(Permission.Groups) do
		if Permission.MinHierarchy then
			if vRP.HasGroup(Passport, GroupName, Permission.MinHierarchy) then
				HasGroup = true
				break
			end
		else
			if vRP.HasGroup(Passport, GroupName) then
				HasGroup = true
				break
			end
		end
	end
	
	return HasGroup
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DE BANCO DE DADOS
-----------------------------------------------------------------------------------------------------------------------------------------
Config.Database = {
	-- Nome da tabela de portas
	DoorTable = "node_doors"
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DE VALIDAÇÃO
-----------------------------------------------------------------------------------------------------------------------------------------
Config.Validation = {
	-- Tamanho máximo do nome de porta
	MaxNameLength = 50,
	
	-- Tamanho mínimo do nome de porta
	MinNameLength = 3,
	
	-- Caracteres permitidos no nome (regex pattern)
	AllowedNameChars = "^[%w%s%-_]+$"
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DE COMANDOS
-----------------------------------------------------------------------------------------------------------------------------------------
Config.Commands = {
	-- Comando para abrir o painel de gerenciamento de portas
	OpenPanel = "doors"
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGURAÇÕES DE INTERFACE
-----------------------------------------------------------------------------------------------------------------------------------------
Config.UI = {
	-- Avatar padrão exibido no painel (será o mesmo para todos os jogadores)
	-- Coloque aqui o link direto da imagem (PNG, JPG, etc)
	-- Exemplos:
	-- "https://i.imgur.com/SuaImagem.png"
	-- "https://cdn.discordapp.com/attachments/.../logo.png"
	Avatar = "https://i.imgur.com/8ciNGcq.png"
}

