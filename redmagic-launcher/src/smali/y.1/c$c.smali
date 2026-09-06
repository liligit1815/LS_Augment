.class Ly/c$c;
.super Ljava/lang/Object;
.source "AnimationHandler.java"

# interfaces
.implements Ly/c$b;
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic g:Ly/c;


# direct methods
.method constructor <init>(Ly/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly/c$c;->g:Ly/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ly/c$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public doFrame(J)V
    .locals 2

    .line 1
    iget-object p0, p0, Ly/c$c;->g:Ly/c;

    .line 2
    .line 3
    const-wide/32 v0, 0xf4240

    .line 4
    .line 5
    .line 6
    div-long/2addr p1, v0

    .line 7
    invoke-virtual {p0, p1, p2}, Ly/c;->f(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
