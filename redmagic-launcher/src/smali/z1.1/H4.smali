.class public final synthetic Lz1/H4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lz1/I4;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Ljava/util/HashSet;

.field public final synthetic d:Landroid/content/Context;

.field public final synthetic e:Lz1/o3;

.field public final synthetic f:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lz1/I4;Ljava/util/HashMap;Ljava/util/HashSet;Landroid/content/Context;Lz1/o3;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/H4;->a:Lz1/I4;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/H4;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/H4;->c:Ljava/util/HashSet;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/H4;->d:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/H4;->e:Lz1/o3;

    .line 13
    .line 14
    iput-object p6, p0, Lz1/H4;->f:Ljava/util/ArrayList;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lz1/H4;->a:Lz1/I4;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/H4;->b:Ljava/util/HashMap;

    .line 4
    .line 5
    iget-object v2, p0, Lz1/H4;->c:Ljava/util/HashSet;

    .line 6
    .line 7
    iget-object v3, p0, Lz1/H4;->d:Landroid/content/Context;

    .line 8
    .line 9
    iget-object v4, p0, Lz1/H4;->e:Lz1/o3;

    .line 10
    .line 11
    iget-object v5, p0, Lz1/H4;->f:Ljava/util/ArrayList;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 15
    .line 16
    invoke-static/range {v0 .. v6}, Lz1/I4;->b(Lz1/I4;Ljava/util/HashMap;Ljava/util/HashSet;Landroid/content/Context;Lz1/o3;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
