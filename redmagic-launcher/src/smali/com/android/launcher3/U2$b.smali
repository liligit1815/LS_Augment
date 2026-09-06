.class Lcom/android/launcher3/U2$b;
.super Ljava/io/IOException;
.source "LauncherBackupHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/U2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/U2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/U2;Ljava/lang/String;)V
    .locals 0

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/U2$b;->g:Lcom/android/launcher3/U2;

    .line 4
    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/U2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/U2$b;->g:Lcom/android/launcher3/U2;

    .line 2
    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method
