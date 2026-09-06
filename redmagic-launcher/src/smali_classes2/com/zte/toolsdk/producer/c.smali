.class public final synthetic Lcom/zte/toolsdk/producer/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/os/Messenger;

.field public final synthetic h:Landroid/os/Message;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Messenger;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/producer/c;->g:Landroid/os/Messenger;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/producer/c;->h:Landroid/os/Message;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/c;->g:Landroid/os/Messenger;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/producer/c;->h:Landroid/os/Message;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/zte/toolsdk/producer/ToolsTask;->a(Landroid/os/Messenger;Landroid/os/Message;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
