.class Lcom/android/launcher3/popup/P$a;
.super Ljava/lang/Object;
.source "SystemShortcut.java"

# interfaces
.implements Lcom/android/launcher3/popup/P$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/popup/P$i<",
        "Lcom/android/launcher3/C2;",
        ">;"
    }
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/l0;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/popup/P$a;->b(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            ")",
            "Lcom/android/launcher3/popup/P<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->A:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/P$a;->g:Lcom/android/launcher3/l0;

    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    new-instance v0, Lcom/android/launcher3/l0;

    .line 46
    .line 47
    invoke-direct {v0}, Lcom/android/launcher3/l0;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/popup/P$a;->g:Lcom/android/launcher3/l0;

    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/popup/P$a;->g:Lcom/android/launcher3/l0;

    .line 53
    .line 54
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/l0;->d(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    return-object v1

    .line 61
    :cond_2
    new-instance v0, Lcom/android/launcher3/popup/P$g;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/popup/P$a;->g:Lcom/android/launcher3/l0;

    .line 64
    .line 65
    invoke-direct {v0, p1, p2, p0, p3}, Lcom/android/launcher3/popup/P$g;-><init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/l0;Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_3
    :goto_0
    return-object v1
.end method
