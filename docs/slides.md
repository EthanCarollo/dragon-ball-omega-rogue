---
asSlides: true
---

## Dragon Ball Omega Rogue

![](assets/dbrogue.png)


---

## Le Pitch

Créer un jeu vidéo sur le thème de Dragon Ball en utilisant des designs pattern avec quelques contraintes.

---

## De quoi on va parler

1. Le systeme de scene (State Pattern)

2. Le choix de personnage (Singleton & Builder Pattern)
3. L'interface d'entrainement
4. Le choix du niveau (Factory Pattern)
5. Le combat (Command & Composite & Proxy Pattern)
6. Les récompenses (Decorator & Memento Pattern)
7. Système de notifications (Observer Pattern)

<Alert message="Ceci est un message important!" />

---

## 1. Le systeme de scene

> Le système de scènes basé sur le State Pattern encapsule chaque scène comme un état distinct, avec le moteur qui délègue l'exécution à la scène active pour des transitions fluides.

---

## 1.1 Un petit exemple de ma classe Game


> Petit exemple de la classe qui "hold" le state, dans cet exemple, MainMenuScene est mon state par défaut.

```ruby
class Game
    def initialize
      @current_scene = MainMenuScene.new(self)
    end
  
    def update
      @current_scene.update
    end
  
    def draw
      @current_scene.draw
    end
  
    def button_down(id)
      @current_scene.button_down(id)
    end
  
    def change_scene(scene)
      @current_scene = scene
    end
end
```
---

## 1.2 Un petit exemple de ma classe Scene


> La classe Scene qui represente donc un state de mon Game

```ruby
class MenuScene < Scene
  def initialize(game)
    @game = game
  end

  def update
   # update logics
  end

  def draw
    # draw code...
  end

  def button_down(id)
    if id == "enter"
        @game.change_scene(CreateCharacterScene.new(@game))
    end
  end
end

```