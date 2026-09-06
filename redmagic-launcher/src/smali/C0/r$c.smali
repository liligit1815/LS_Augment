.class public final enum LC0/r$c;
.super Ljava/lang/Enum;
.source "ShapeStroke.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LC0/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LC0/r$c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LC0/r$c;

.field public static final enum h:LC0/r$c;

.field public static final enum i:LC0/r$c;

.field private static final synthetic j:[LC0/r$c;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LC0/r$c;

    .line 2
    .line 3
    const-string v1, "MITER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LC0/r$c;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LC0/r$c;->g:LC0/r$c;

    .line 10
    .line 11
    new-instance v0, LC0/r$c;

    .line 12
    .line 13
    const-string v1, "ROUND"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LC0/r$c;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LC0/r$c;->h:LC0/r$c;

    .line 20
    .line 21
    new-instance v0, LC0/r$c;

    .line 22
    .line 23
    const-string v1, "BEVEL"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LC0/r$c;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LC0/r$c;->i:LC0/r$c;

    .line 30
    .line 31
    invoke-static {}, LC0/r$c;->a()[LC0/r$c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, LC0/r$c;->j:[LC0/r$c;

    .line 36
    .line 37
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

.method private static synthetic a()[LC0/r$c;
    .locals 3

    .line 1
    sget-object v0, LC0/r$c;->g:LC0/r$c;

    .line 2
    .line 3
    sget-object v1, LC0/r$c;->h:LC0/r$c;

    .line 4
    .line 5
    sget-object v2, LC0/r$c;->i:LC0/r$c;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [LC0/r$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LC0/r$c;
    .locals 1

    .line 1
    const-class v0, LC0/r$c;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LC0/r$c;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LC0/r$c;
    .locals 1

    .line 1
    sget-object v0, LC0/r$c;->j:[LC0/r$c;

    .line 2
    .line 3
    invoke-virtual {v0}, [LC0/r$c;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LC0/r$c;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public c()Landroid/graphics/Paint$Join;
    .locals 1

    .line 1
    sget-object v0, LC0/r$a;->b:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object p0, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    sget-object p0, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    .line 27
    .line 28
    return-object p0
.end method
