.class public final synthetic Lz1/a4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lz1/h4;

.field public final synthetic b:Ljava/util/function/Predicate;

.field public final synthetic c:Lcom/android/launcher3/util/z0;

.field public final synthetic d:Lz1/m;

.field public final synthetic e:Lcom/android/launcher3/util/z0;

.field public final synthetic f:Z

.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Ljava/util/HashSet;

.field public final synthetic i:Ljava/util/ArrayList;

.field public final synthetic j:Ljava/util/HashMap;

.field public final synthetic k:Ls1/P;

.field public final synthetic l:Lcom/android/launcher3/util/p0;

.field public final synthetic m:Lcom/android/launcher3/P2;

.field public final synthetic n:Ljava/util/ArrayList;

.field public final synthetic o:Lz1/o3;


# direct methods
.method public synthetic constructor <init>(Lz1/h4;Ljava/util/function/Predicate;Lcom/android/launcher3/util/z0;Lz1/m;Lcom/android/launcher3/util/z0;ZLandroid/content/Context;Ljava/util/HashSet;Ljava/util/ArrayList;Ljava/util/HashMap;Ls1/P;Lcom/android/launcher3/util/p0;Lcom/android/launcher3/P2;Ljava/util/ArrayList;Lz1/o3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/a4;->a:Lz1/h4;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/a4;->b:Ljava/util/function/Predicate;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/a4;->c:Lcom/android/launcher3/util/z0;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/a4;->d:Lz1/m;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/a4;->e:Lcom/android/launcher3/util/z0;

    .line 13
    .line 14
    iput-boolean p6, p0, Lz1/a4;->f:Z

    .line 15
    .line 16
    iput-object p7, p0, Lz1/a4;->g:Landroid/content/Context;

    .line 17
    .line 18
    iput-object p8, p0, Lz1/a4;->h:Ljava/util/HashSet;

    .line 19
    .line 20
    iput-object p9, p0, Lz1/a4;->i:Ljava/util/ArrayList;

    .line 21
    .line 22
    iput-object p10, p0, Lz1/a4;->j:Ljava/util/HashMap;

    .line 23
    .line 24
    iput-object p11, p0, Lz1/a4;->k:Ls1/P;

    .line 25
    .line 26
    iput-object p12, p0, Lz1/a4;->l:Lcom/android/launcher3/util/p0;

    .line 27
    .line 28
    iput-object p13, p0, Lz1/a4;->m:Lcom/android/launcher3/P2;

    .line 29
    .line 30
    iput-object p14, p0, Lz1/a4;->n:Ljava/util/ArrayList;

    .line 31
    .line 32
    iput-object p15, p0, Lz1/a4;->o:Lz1/o3;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lz1/a4;->a:Lz1/h4;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Lz1/a4;->b:Ljava/util/function/Predicate;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Lz1/a4;->c:Lcom/android/launcher3/util/z0;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, v0, Lz1/a4;->d:Lz1/m;

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, v0, Lz1/a4;->e:Lcom/android/launcher3/util/z0;

    .line 16
    .line 17
    move-object v6, v5

    .line 18
    iget-boolean v5, v0, Lz1/a4;->f:Z

    .line 19
    .line 20
    move-object v7, v6

    .line 21
    iget-object v6, v0, Lz1/a4;->g:Landroid/content/Context;

    .line 22
    .line 23
    move-object v8, v7

    .line 24
    iget-object v7, v0, Lz1/a4;->h:Ljava/util/HashSet;

    .line 25
    .line 26
    move-object v9, v8

    .line 27
    iget-object v8, v0, Lz1/a4;->i:Ljava/util/ArrayList;

    .line 28
    .line 29
    move-object v10, v9

    .line 30
    iget-object v9, v0, Lz1/a4;->j:Ljava/util/HashMap;

    .line 31
    .line 32
    move-object v11, v10

    .line 33
    iget-object v10, v0, Lz1/a4;->k:Ls1/P;

    .line 34
    .line 35
    move-object v12, v11

    .line 36
    iget-object v11, v0, Lz1/a4;->l:Lcom/android/launcher3/util/p0;

    .line 37
    .line 38
    move-object v13, v12

    .line 39
    iget-object v12, v0, Lz1/a4;->m:Lcom/android/launcher3/P2;

    .line 40
    .line 41
    move-object v14, v13

    .line 42
    iget-object v13, v0, Lz1/a4;->n:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget-object v0, v0, Lz1/a4;->o:Lz1/o3;

    .line 45
    .line 46
    move-object/from16 v15, p1

    .line 47
    .line 48
    check-cast v15, Lcom/android/launcher3/model/data/I;

    .line 49
    .line 50
    move-object/from16 v16, v14

    .line 51
    .line 52
    move-object v14, v0

    .line 53
    move-object/from16 v0, v16

    .line 54
    .line 55
    invoke-static/range {v0 .. v15}, Lz1/h4;->b(Lz1/h4;Ljava/util/function/Predicate;Lcom/android/launcher3/util/z0;Lz1/m;Lcom/android/launcher3/util/z0;ZLandroid/content/Context;Ljava/util/HashSet;Ljava/util/ArrayList;Ljava/util/HashMap;Ls1/P;Lcom/android/launcher3/util/p0;Lcom/android/launcher3/P2;Ljava/util/ArrayList;Lz1/o3;Lcom/android/launcher3/model/data/I;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
