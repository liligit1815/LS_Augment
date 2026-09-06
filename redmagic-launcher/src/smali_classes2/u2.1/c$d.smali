.class public interface abstract Lu2/c$d;
.super Ljava/lang/Object;
.source "ActivityTransitionAnimator.kt"

# interfaces
.implements Lu2/F$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/c$d$a;
    }
.end annotation


# static fields
.field public static final a:Lu2/c$d$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lu2/c$d$a;->a:Lu2/c$d$a;

    .line 2
    .line 3
    sput-object v0, Lu2/c$d;->a:Lu2/c$d$a;

    .line 4
    .line 5
    return-void
.end method

.method public static g(Landroid/view/View;Ljava/lang/Integer;)Lu2/c$d;
    .locals 1

    .line 1
    sget-object v0, Lu2/c$d;->a:Lu2/c$d$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lu2/c$d$a;->a(Landroid/view/View;Ljava/lang/Integer;)Lu2/c$d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic k(Lu2/c$d;Ljava/lang/Boolean;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    and-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    invoke-interface {p0, p1}, Lu2/c$d;->c(Ljava/lang/Boolean;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 13
    .line 14
    const-string p1, "Super calls with default arguments not supported in this target, function: onTransitionAnimationCancelled"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()Lu2/c$f;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
