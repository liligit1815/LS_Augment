.class Lcom/android/launcher3/iconarrange/MenuIconArrange$a;
.super Ljava/lang/Object;
.source "MenuIconArrange.java"

# interfaces
.implements Lcom/android/launcher3/iconarrange/l$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/MenuIconArrange;->F()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/iconarrange/MenuIconArrange;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/MenuIconArrange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;->a:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;II)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;->a:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->e(Lcom/android/launcher3/iconarrange/MenuIconArrange;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;->a:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->e(Lcom/android/launcher3/iconarrange/MenuIconArrange;)Lcom/android/launcher3/C2;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getScroller()Landroid/widget/OverScroller;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;->a:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->e(Lcom/android/launcher3/iconarrange/MenuIconArrange;)Lcom/android/launcher3/C2;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getScroller()Landroid/widget/OverScroller;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;->a:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->setIconArrangeCurrentPage(I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$a;->a:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->e(Lcom/android/launcher3/iconarrange/MenuIconArrange;)Lcom/android/launcher3/C2;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/4 p1, 0x1

    .line 66
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/Workspace;->t2(IZ)V

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method
