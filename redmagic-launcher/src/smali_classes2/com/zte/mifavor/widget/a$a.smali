.class Lcom/zte/mifavor/widget/a$a;
.super Ljava/lang/Object;
.source "ActivityCommon.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/a;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/a;->a(Lcom/zte/mifavor/widget/a;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/zte/mifavor/widget/a;->a(Lcom/zte/mifavor/widget/a;)Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/zte/mifavor/widget/a;->b(Lcom/zte/mifavor/widget/a;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/a;->d(Lcom/zte/mifavor/widget/a;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 52
    .line 53
    const-string v1, "onGlobalLayout..."

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/a;->e(Lcom/zte/mifavor/widget/a;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/zte/mifavor/widget/a$a;->g:Lcom/zte/mifavor/widget/a;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/zte/mifavor/widget/a;->c(Lcom/zte/mifavor/widget/a;)Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/a;->m(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
