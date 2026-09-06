.class public final synthetic Lcom/android/launcher3/model/data/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/model/data/y;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/model/data/u;->a:Lcom/android/launcher3/model/data/y;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/u;->a:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    check-cast p1, Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/model/data/y;->e(Lcom/android/launcher3/model/data/y;Landroid/content/ComponentName;)Lcom/android/launcher3/logger/LauncherAtom$Shortcut$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
