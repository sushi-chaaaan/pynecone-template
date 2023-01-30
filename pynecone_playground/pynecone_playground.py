"""Welcome to Pynecone! This file outlines the steps to create a basic app."""
import pynecone as pc

from pcconfig import config

docs_url = "https://pynecone.io/docs/getting-started/introduction"
filename = f"{config.app_name}/{config.app_name}.py"


class State(pc.State):
    count: int = 0

    def increment_by_2(self):
        self.count += 2

    def decrement_by_2(self):
        self.count -= 2


def index():
    return pc.hstack(
        pc.button(
            "Decrement",
            color_scheme="red",
            border_radius="1em",
            on_click=State.decrement_by_2,
        ),
        pc.heading(State.count, font_size="2em"),
        pc.button(
            "Increment",
            color_scheme="green",
            border_radius="1em",
            on_click=State.increment_by_2,
        ),
    )


app = pc.App(state=State)
app.add_page(index)
app.compile()
