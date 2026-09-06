.class public final Lcom/android/launcher3/uioverrides/O;
.super Ljava/lang/Object;
.source "QuickstepWidgetHolder_QuickstepWidgetHolderFactory_Impl.java"

# interfaces
.implements Lcom/android/launcher3/widget/l0$b;


# instance fields
.field private final a:Lcom/android/launcher3/uioverrides/N;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/N;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/O;->a:Lcom/android/launcher3/uioverrides/N;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Lcom/android/launcher3/uioverrides/N;)Lf4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/uioverrides/N;",
            ")",
            "Lf4/f<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/O;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/O;-><init>(Lcom/android/launcher3/uioverrides/N;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/O;->c(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/H;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/H;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/O;->a:Lcom/android/launcher3/uioverrides/N;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/N;->b(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/H;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
