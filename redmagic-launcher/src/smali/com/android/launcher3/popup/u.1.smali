.class public final synthetic Lcom/android/launcher3/popup/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/popup/P$i;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/y2$b;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/y2$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/u;->g:Lcom/android/launcher3/util/y2$b;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/u;->g:Lcom/android/launcher3/util/y2$b;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/popup/v;->a(Lcom/android/launcher3/util/y2$b;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
