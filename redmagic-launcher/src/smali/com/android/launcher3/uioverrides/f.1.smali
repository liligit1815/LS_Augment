.class public final Lcom/android/launcher3/uioverrides/f;
.super Ljava/lang/Object;
.source "QuickstepAppWidgetHostProvider.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/uioverrides/f$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/uioverrides/f;

.field private static final b:Lh4/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/uioverrides/f;->a:Lcom/android/launcher3/uioverrides/f;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/uioverrides/e;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/e;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/android/launcher3/uioverrides/f;->b:Lh4/e;

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()Lcom/android/launcher3/widget/p0;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/uioverrides/f;->c()Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static final b()Lcom/android/launcher3/widget/p0;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/uioverrides/f;->b:Lh4/e;

    .line 2
    .line 3
    invoke-interface {v0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/widget/p0;

    .line 8
    .line 9
    return-object v0
.end method

.method private static final c()Lcom/android/launcher3/widget/p0;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/f$a;

    .line 4
    .line 5
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "currentApplication(...)"

    .line 10
    .line 11
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v3, Lcom/android/launcher3/widget/p0;->c:Lcom/android/launcher3/widget/p0$a;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/android/launcher3/widget/p0$a;->a()Lcom/android/launcher3/util/p1;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/uioverrides/f$a;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;)V

    .line 21
    .line 22
    .line 23
    const/16 v2, 0x400

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/widget/p0;-><init>(Landroid/content/Context;I)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method
