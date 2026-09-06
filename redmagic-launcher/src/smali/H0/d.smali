.class public LH0/d;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field private static a:Lv0/s;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LH0/c;

    .line 2
    .line 3
    invoke-direct {v0}, LH0/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LH0/d;->a:Lv0/s;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, LH0/d;->a:Lv0/s;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lv0/s;->c(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, LH0/d;->a:Lv0/s;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lv0/s;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, LH0/d;->a:Lv0/s;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lv0/s;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, LH0/d;->a:Lv0/s;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lv0/s;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
