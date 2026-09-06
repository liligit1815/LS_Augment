.class public final synthetic Lcom/android/launcher3/anim/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/anim/J;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Landroidx/dynamicanimation/animation/g;

.field public final synthetic d:F

.field public final synthetic e:F

.field public final synthetic f:Landroidx/dynamicanimation/animation/e$q;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/anim/J;Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;FFLandroidx/dynamicanimation/animation/e$q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/I;->a:Lcom/android/launcher3/anim/J;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/anim/I;->b:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/anim/I;->c:Landroidx/dynamicanimation/animation/g;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/anim/I;->d:F

    .line 11
    .line 12
    iput p5, p0, Lcom/android/launcher3/anim/I;->e:F

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/anim/I;->f:Landroidx/dynamicanimation/animation/e$q;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/I;->a:Lcom/android/launcher3/anim/J;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/anim/I;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/anim/I;->c:Landroidx/dynamicanimation/animation/g;

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/anim/I;->d:F

    .line 8
    .line 9
    iget v4, p0, Lcom/android/launcher3/anim/I;->e:F

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/anim/I;->f:Landroidx/dynamicanimation/animation/e$q;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    move v7, p2

    .line 15
    move v8, p3

    .line 16
    move v9, p4

    .line 17
    invoke-static/range {v0 .. v9}, Lcom/android/launcher3/anim/J;->a(Lcom/android/launcher3/anim/J;Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;FFLandroidx/dynamicanimation/animation/e$q;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
