.class Lcom/android/launcher3/c1$b;
.super Ljava/lang/Object;
.source "IconUpdateProxy.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/c1;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/Collection;

.field final synthetic b:Lcom/android/launcher3/c1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/c1;Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/c1$b;->b:Lcom/android/launcher3/c1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/c1$b;->a:Ljava/util/Collection;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/c1$b;->a:Ljava/util/Collection;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance p3, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/c1$b;->b:Lcom/android/launcher3/c1;

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/android/launcher3/c1;->f(Lcom/android/launcher3/c1;Lcom/android/launcher3/model/data/I;)Landroid/content/pm/ShortcutInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v2, "updateAllShortcuts shortcutInfo is null workspaceItemInfo: "

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "Launcher.Model"

    .line 50
    .line 51
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/z;->C()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    const-string v3, "needShowBadge"

    .line 60
    .line 61
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/H5;->a1(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/launcher3/c1$b;->b:Lcom/android/launcher3/c1;

    .line 65
    .line 66
    invoke-static {v2}, Lcom/android/launcher3/c1;->d(Lcom/android/launcher3/c1;)Lcom/android/launcher3/D3;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->i0()Ls1/P;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2, v0, v1}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {p1, p3}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
