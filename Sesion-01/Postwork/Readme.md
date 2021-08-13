`Desarrollo Mobile` > `Swift Avanzado`

## Custom Components

### OBJETIVO

- Crear clases de componentes de UI Personalizados.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

**Desarrollar**:

Subclases de los siguientes elementos:

	- UIButton
	- UILabel
	- UICollectionViewCell

Dichas subclases deben incorporar un Enum que permita establecer el tipo de elemento, ej.

```
case rounded
```

Indicará que se trata de un bo†ón redondo completamente.

Otro ejemplo:

```
case roundedWithIcon
```

Indicará que el button lleva un Icono enmedio y además es redondo.

Cada uno de los componentes debe implementar un Enum, un Protocolo y un extensión que de funcionalidad por default al protocoolo.