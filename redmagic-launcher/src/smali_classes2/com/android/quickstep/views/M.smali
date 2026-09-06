.class public final synthetic Lcom/android/quickstep/views/M;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$r;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsDismissUtils;

.field public final synthetic b:Z

.field public final synthetic c:Landroid/util/FloatProperty;

.field public final synthetic d:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsDismissUtils;ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/M;->a:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/views/M;->b:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/M;->c:Landroid/util/FloatProperty;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/M;->d:Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Landroidx/dynamicanimation/animation/e;FF)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/M;->a:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/views/M;->b:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/M;->c:Landroid/util/FloatProperty;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/views/M;->d:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    move-object v4, p1

    .line 10
    move v5, p2

    .line 11
    move v6, p3

    .line 12
    invoke-static/range {v0 .. v6}, Lcom/android/quickstep/views/RecentsDismissUtils;->f(Lcom/android/quickstep/views/RecentsDismissUtils;ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
