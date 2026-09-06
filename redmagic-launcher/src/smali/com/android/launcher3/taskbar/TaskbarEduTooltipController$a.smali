.class public final Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;
.super Ljava/lang/Object;
.source "TaskbarEduTooltipController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;
    .locals 1

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-class p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 7
    .line 8
    const v0, 0x7f140434

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "getObject(...)"

    .line 16
    .line 17
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    check-cast p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 21
    .line 22
    return-object p0
.end method
