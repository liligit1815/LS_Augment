.class public final Lcom/android/launcher3/uioverrides/N;
.super Ljava/lang/Object;
.source "QuickstepWidgetHolder_Factory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lcom/android/launcher3/uioverrides/N;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/N;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/N;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/H;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/H;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/H;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/H;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/N;->c(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/H;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
