.class public final synthetic Lcom/android/quickstep/util/unfold/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Ljava/util/ArrayList;

.field public final synthetic h:Z

.field public final synthetic i:Landroid/graphics/Point;

.field public final synthetic j:Lcom/android/launcher3/anim/V;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/g;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/util/unfold/g;->h:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/unfold/g;->i:Landroid/graphics/Point;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/unfold/g;->j:Lcom/android/launcher3/anim/V;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/g;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/util/unfold/g;->h:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/unfold/g;->i:Landroid/graphics/Point;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/g;->j:Lcom/android/launcher3/anim/V;

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->a(Ljava/util/ArrayList;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;Lcom/android/launcher3/CellLayout;)Lh4/t;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
