.class public abstract LT/a;
.super Ljava/lang/Object;
.source "PathIteratorImpl.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LT/a$a;
    }
.end annotation


# static fields
.field private static final a:LT/a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LT/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LT/a$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LT/a;->a:LT/a$a;

    .line 8
    .line 9
    const-string v0, "androidx.graphics.path"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
