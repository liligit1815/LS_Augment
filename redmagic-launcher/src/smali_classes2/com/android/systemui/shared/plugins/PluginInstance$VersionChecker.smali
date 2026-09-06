.class public interface abstract Lcom/android/systemui/shared/plugins/PluginInstance$VersionChecker;
.super Ljava/lang/Object;
.source "PluginInstance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/plugins/PluginInstance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VersionChecker"
.end annotation


# virtual methods
.method public abstract checkVersion(Ljava/lang/Class;Ljava/lang/Class;Lx2/c;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lx2/c;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lx2/c;",
            ")Z"
        }
    .end annotation
.end method

.method public abstract getVersionInfo(Ljava/lang/Class;)Lcom/android/systemui/shared/plugins/VersionInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lx2/c;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/android/systemui/shared/plugins/VersionInfo;"
        }
    .end annotation
.end method
