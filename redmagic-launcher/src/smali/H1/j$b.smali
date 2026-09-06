.class public final enum LH1/j$b;
.super Ljava/lang/Enum;
.source "ResponsiveSpec.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH1/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LH1/j$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LH1/j$b;

.field public static final enum h:LH1/j$b;

.field private static final synthetic i:[LH1/j$b;

.field private static final synthetic j:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LH1/j$b;

    .line 2
    .line 3
    const-string v1, "HEIGHT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LH1/j$b;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LH1/j$b;->g:LH1/j$b;

    .line 10
    .line 11
    new-instance v0, LH1/j$b;

    .line 12
    .line 13
    const-string v1, "WIDTH"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LH1/j$b;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LH1/j$b;->h:LH1/j$b;

    .line 20
    .line 21
    invoke-static {}, LH1/j$b;->a()[LH1/j$b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, LH1/j$b;->i:[LH1/j$b;

    .line 26
    .line 27
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, LH1/j$b;->j:Ln4/a;

    .line 32
    .line 33
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final synthetic a()[LH1/j$b;
    .locals 2

    .line 1
    sget-object v0, LH1/j$b;->g:LH1/j$b;

    .line 2
    .line 3
    sget-object v1, LH1/j$b;->h:LH1/j$b;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [LH1/j$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static c()Ln4/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ln4/a<",
            "LH1/j$b;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, LH1/j$b;->j:Ln4/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LH1/j$b;
    .locals 1

    .line 1
    const-class v0, LH1/j$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LH1/j$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LH1/j$b;
    .locals 1

    .line 1
    sget-object v0, LH1/j$b;->i:[LH1/j$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LH1/j$b;

    .line 8
    .line 9
    return-object v0
.end method
