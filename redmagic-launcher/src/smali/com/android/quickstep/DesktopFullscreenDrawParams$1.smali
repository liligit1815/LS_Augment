.class final synthetic Lcom/android/quickstep/DesktopFullscreenDrawParams$1;
.super Lkotlin/jvm/internal/m;
.source "DesktopFullscreenDrawParams.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/DesktopFullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;ILkotlin/jvm/internal/j;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/l<",
        "Landroid/content/Context;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v5, "computeCornerRadius(Landroid/content/Context;)F"

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    const-class v3, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;

    .line 6
    .line 7
    const-string v4, "computeCornerRadius"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v2, p1

    .line 11
    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final invoke(Landroid/content/Context;)Ljava/lang/Float;
    .locals 1

    const-string v0, "p0"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iget-object p0, p0, Lkotlin/jvm/internal/f;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;

    invoke-static {p0, p1}, Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;->access$computeCornerRadius(Lcom/android/quickstep/DesktopFullscreenDrawParams$Companion;Landroid/content/Context;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/DesktopFullscreenDrawParams$1;->invoke(Landroid/content/Context;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method
