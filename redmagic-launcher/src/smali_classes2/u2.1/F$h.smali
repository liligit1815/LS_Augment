.class abstract enum Lu2/F$h;
.super Ljava/lang/Enum;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/F$h$a;,
        Lu2/F$h$b;,
        Lu2/F$h$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lu2/F$h;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:Lu2/F$h;

.field public static final enum h:Lu2/F$h;

.field public static final enum i:Lu2/F$h;

.field private static final synthetic j:[Lu2/F$h;

.field private static final synthetic k:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lu2/F$h$a;

    .line 2
    .line 3
    const-string v1, "CENTER_X"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lu2/F$h$a;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lu2/F$h;->g:Lu2/F$h;

    .line 10
    .line 11
    new-instance v0, Lu2/F$h$b;

    .line 12
    .line 13
    const-string v1, "CENTER_Y"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lu2/F$h$b;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lu2/F$h;->h:Lu2/F$h;

    .line 20
    .line 21
    new-instance v0, Lu2/F$h$c;

    .line 22
    .line 23
    const-string v1, "SCALE"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lu2/F$h$c;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lu2/F$h;->i:Lu2/F$h;

    .line 30
    .line 31
    invoke-static {}, Lu2/F$h;->a()[Lu2/F$h;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lu2/F$h;->j:[Lu2/F$h;

    .line 36
    .line 37
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lu2/F$h;->k:Ln4/a;

    .line 42
    .line 43
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lu2/F$h;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method private static final synthetic a()[Lu2/F$h;
    .locals 3

    .line 1
    sget-object v0, Lu2/F$h;->g:Lu2/F$h;

    .line 2
    .line 3
    sget-object v1, Lu2/F$h;->h:Lu2/F$h;

    .line 4
    .line 5
    sget-object v2, Lu2/F$h;->i:Lu2/F$h;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lu2/F$h;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lu2/F$h;
    .locals 1

    .line 1
    const-class v0, Lu2/F$h;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lu2/F$h;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lu2/F$h;
    .locals 1

    .line 1
    sget-object v0, Lu2/F$h;->j:[Lu2/F$h;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lu2/F$h;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract c(Lu2/F$i;)F
.end method

.method public abstract d(Lu2/F$i;F)V
.end method
