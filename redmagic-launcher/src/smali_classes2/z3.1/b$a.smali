.class public final Lz3/b$a;
.super Ljava/lang/Object;
.source "MSDLHistoryLogger.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz3/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final synthetic a:Lz3/b$a;

.field private static final b:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lz3/b$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lz3/b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lz3/b$a;->a:Lz3/b$a;

    .line 7
    .line 8
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 9
    .line 10
    const-string v1, "MM-dd HH:mm:ss.SSS"

    .line 11
    .line 12
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lz3/b$a;->b:Ljava/text/SimpleDateFormat;

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Ljava/text/SimpleDateFormat;
    .locals 0

    .line 1
    sget-object p0, Lz3/b$a;->b:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    return-object p0
.end method
