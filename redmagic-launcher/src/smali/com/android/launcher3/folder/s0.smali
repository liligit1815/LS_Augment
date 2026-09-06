.class public final synthetic Lcom/android/launcher3/folder/s0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/folder/u0;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/u0;ZZLjava/lang/Runnable;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/s0;->a:Lcom/android/launcher3/folder/u0;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/folder/s0;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/folder/s0;->c:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/folder/s0;->d:Ljava/lang/Runnable;

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/android/launcher3/folder/s0;->e:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/s0;->a:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/folder/s0;->b:Z

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/folder/s0;->c:Z

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/folder/s0;->d:Ljava/lang/Runnable;

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/launcher3/folder/s0;->e:Z

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    move v6, p2

    .line 13
    move v7, p3

    .line 14
    move v8, p4

    .line 15
    invoke-static/range {v0 .. v8}, Lcom/android/launcher3/folder/u0;->e(Lcom/android/launcher3/folder/u0;ZZLjava/lang/Runnable;ZLandroidx/dynamicanimation/animation/e;ZFF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
