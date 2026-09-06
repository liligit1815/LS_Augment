.class public final Lcom/android/quickstep/util/SplitScreenUtils;
.super Ljava/lang/Object;
.source "SplitScreenUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SplitScreenUtils$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/SplitScreenUtils$Companion;

.field private static final TAG:Ljava/lang/String; = "SplitScreenUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SplitScreenUtils$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/SplitScreenUtils$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/SplitScreenUtils;->Companion:Lcom/android/quickstep/util/SplitScreenUtils$Companion;

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

.method public static final convertShellSplitBoundsToLauncher(Lcom/android/wm/shell/shared/split/SplitBounds;)Lcom/android/launcher3/util/y2$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/SplitScreenUtils;->Companion:Lcom/android/quickstep/util/SplitScreenUtils$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/SplitScreenUtils$Companion;->convertShellSplitBoundsToLauncher(Lcom/android/wm/shell/shared/split/SplitBounds;)Lcom/android/launcher3/util/y2$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
