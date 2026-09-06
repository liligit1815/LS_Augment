.class public final synthetic Lcom/android/quickstep/views/x;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$r;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:I

.field public final synthetic c:Lcom/android/quickstep/views/TaskView;

.field public final synthetic d:Lcom/android/quickstep/views/RecentsDismissUtils;

.field public final synthetic e:Landroidx/dynamicanimation/animation/g;


# direct methods
.method public synthetic constructor <init>(ZILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/views/x;->a:Z

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/views/x;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/x;->c:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/x;->d:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/views/x;->e:Landroidx/dynamicanimation/animation/g;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Landroidx/dynamicanimation/animation/e;FF)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/x;->a:Z

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/x;->b:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/x;->c:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/views/x;->d:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/views/x;->e:Landroidx/dynamicanimation/animation/g;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    move v6, p2

    .line 13
    move v7, p3

    .line 14
    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/views/RecentsDismissUtils;->k(ZILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
