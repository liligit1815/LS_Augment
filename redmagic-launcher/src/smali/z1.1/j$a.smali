.class Lz1/j$a;
.super Ljava/lang/Object;
.source "AddWorkspaceItemsTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lz1/j;->a(Lz1/o3;Lz1/y0;Lz1/m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/ArrayList;

.field final synthetic b:Lcom/android/launcher3/util/x0;


# direct methods
.method constructor <init>(Lz1/j;Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lz1/j$a;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p3, p0, Lz1/j$a;->b:Lcom/android/launcher3/util/x0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lz1/y0$b;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lz1/j$a;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lz1/j$a;->a:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    add-int/lit8 v3, v3, -0x1

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    iget v2, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 34
    .line 35
    iget-object v3, p0, Lz1/j$a;->a:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 52
    .line 53
    iget v5, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 54
    .line 55
    if-ne v5, v2, :cond_0

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p0, p0, Lz1/j$a;->b:Lcom/android/launcher3/util/x0;

    .line 66
    .line 67
    invoke-interface {p1, p0, v1, v0}, Lz1/y0$b;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
