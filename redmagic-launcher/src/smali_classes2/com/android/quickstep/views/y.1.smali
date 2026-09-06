.class public final synthetic Lcom/android/quickstep/views/y;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$q;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/android/quickstep/views/RecentsDismissUtils;

.field public final synthetic c:Lcom/android/quickstep/views/TaskView;

.field public final synthetic d:Lu4/a;


# direct methods
.method public synthetic constructor <init>(ZLcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/views/y;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/y;->b:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/y;->c:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/y;->d:Lu4/a;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/y;->a:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/y;->b:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/y;->c:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/views/y;->d:Lu4/a;

    .line 8
    .line 9
    move-object v4, p1

    .line 10
    move v5, p2

    .line 11
    move v6, p3

    .line 12
    move v7, p4

    .line 13
    invoke-static/range {v0 .. v7}, Lcom/android/quickstep/views/RecentsDismissUtils;->o(ZLcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
