.class public final LQ1/a;
.super Lcom/android/launcher3/V3;
.source "EditModeState.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LQ1/a$a;
    }
.end annotation


# static fields
.field public static final D:LQ1/a$a;

.field private static final E:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LQ1/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LQ1/a$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LQ1/a;->D:LQ1/a$a;

    .line 8
    .line 9
    sget v0, Lcom/android/launcher3/V3;->e:I

    .line 10
    .line 11
    sget v1, Lcom/android/launcher3/V3;->f:I

    .line 12
    .line 13
    or-int/2addr v0, v1

    .line 14
    or-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    sget v1, Lcom/android/launcher3/V3;->g:I

    .line 17
    .line 18
    or-int/2addr v0, v1

    .line 19
    sget v1, Lcom/android/launcher3/V3;->h:I

    .line 20
    .line 21
    or-int/2addr v0, v1

    .line 22
    sput v0, LQ1/a;->E:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    sget v1, LQ1/a;->E:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/V3;-><init>(III)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public H(Lcom/android/launcher3/C2;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected g(Landroid/content/Context;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;)F"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const p0, 0x3e19999a    # 0.15f

    .line 8
    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    const/high16 p0, 0x3f000000    # 0.5f

    .line 12
    .line 13
    return p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x96

    .line 7
    .line 8
    return p0
.end method

.method public m(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 1

    .line 1
    const-string p0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->N0(Landroid/content/Context;)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    new-instance p1, Lcom/android/launcher3/V3$h;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-direct {p1, p0, v0, v0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public u(Lcom/android/launcher3/C2;)F
    .locals 0

    .line 1
    const-string p0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const p0, 0x3e4ccccd    # 0.2f

    .line 7
    .line 8
    .line 9
    return p0
.end method

.method public x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;
    .locals 1

    .line 1
    const-string p0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/h0;->N0(Landroid/content/Context;)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    new-instance p1, Lcom/android/launcher3/V3$h;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-direct {p1, p0, v0, v0}, Lcom/android/launcher3/V3$h;-><init>(FFF)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method
