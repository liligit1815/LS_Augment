.class public Lcom/android/quickstep/DesktopFullscreenDrawParams;
.super Lcom/android/quickstep/FullscreenDrawParams;
.source "DesktopFullscreenDrawParams.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/DesktopFullscreenDrawParams;->Companion:Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/DesktopFullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cornerRadiusProvider"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-direct {p0, p1, p2, p2}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lu4/l;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 2
    new-instance p2, Lcom/android/quickstep/DesktopFullscreenDrawParams$1;

    sget-object p3, Lcom/android/quickstep/DesktopFullscreenDrawParams;->Companion:Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;

    invoke-direct {p2, p3}, Lcom/android/quickstep/DesktopFullscreenDrawParams$1;-><init>(Ljava/lang/Object;)V

    .line 3
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/DesktopFullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;)V

    return-void
.end method
