.class final LQ/e;
.super Ljava/lang/Object;
.source "EmojiKeyListener.java"

# interfaces
.implements Landroid/text/method/KeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LQ/e$a;
    }
.end annotation


# instance fields
.field private final g:Landroid/text/method/KeyListener;

.field private final h:LQ/e$a;


# direct methods
.method constructor <init>(Landroid/text/method/KeyListener;)V
    .locals 1

    .line 1
    new-instance v0, LQ/e$a;

    invoke-direct {v0}, LQ/e$a;-><init>()V

    invoke-direct {p0, p1, v0}, LQ/e;-><init>(Landroid/text/method/KeyListener;LQ/e$a;)V

    return-void
.end method

.method constructor <init>(Landroid/text/method/KeyListener;LQ/e$a;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, LQ/e;->g:Landroid/text/method/KeyListener;

    .line 4
    iput-object p2, p0, LQ/e;->h:LQ/e$a;

    return-void
.end method


# virtual methods
.method public clearMetaKeyState(Landroid/view/View;Landroid/text/Editable;I)V
    .locals 0

    .line 1
    iget-object p0, p0, LQ/e;->g:Landroid/text/method/KeyListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Landroid/text/method/KeyListener;->clearMetaKeyState(Landroid/view/View;Landroid/text/Editable;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getInputType()I
    .locals 0

    .line 1
    iget-object p0, p0, LQ/e;->g:Landroid/text/method/KeyListener;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/text/method/KeyListener;->getInputType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, LQ/e;->h:LQ/e$a;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p3, p4}, LQ/e$a;->a(Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, LQ/e;->g:Landroid/text/method/KeyListener;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/method/KeyListener;->onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public onKeyOther(Landroid/view/View;Landroid/text/Editable;Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LQ/e;->g:Landroid/text/method/KeyListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Landroid/text/method/KeyListener;->onKeyOther(Landroid/view/View;Landroid/text/Editable;Landroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onKeyUp(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LQ/e;->g:Landroid/text/method/KeyListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/method/KeyListener;->onKeyUp(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
