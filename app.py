import click
from integrador import app

@click.group()
def cli():
    """integrador's cli"""

@cli.command(name="start")
@click.option("--debug", is_flag=True, help="Run app in debug mode.")
@click.option("--port", default=5000, help="Port to start the webserver.")
def _start(debug, port):
    print("[+] Routes")
    for rule in app.url_map.iter_rules():
        if 'static/<path:filename>' not in str(rule):
            print(f'    http://localhost:{port}{rule}')
    print('\n')

    app.run(debug=True, port=port)

if __name__ == "__main__":
    cli()