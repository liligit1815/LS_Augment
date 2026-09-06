.class public Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;
.super Ljava/lang/Object;
.source "TaskbarModelCallbacksFactory.kt"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;
    }
.end annotation


# static fields
.field public static final g:Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;->g:Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final b(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;->g:Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory$a;->a(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public a(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;)Lcom/android/launcher3/taskbar/j3;
    .locals 0

    .line 1
    const-string p0, "activityContext"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "container"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Lcom/android/launcher3/taskbar/j3;

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/j3;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method
